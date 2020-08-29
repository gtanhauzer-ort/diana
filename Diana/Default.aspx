<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Diana._Default" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.css">
    <script src="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.js"></script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <table id="table" data-detail-view="true" class="table table-striped table-borderless">
        <thead>
            <tr>
                <th data-field="Concepto">Concepto</th>
                <th data-field="Importe" data-align="right">Importe</th>
                <th data-field="%" data-align="right">%</th>
            </tr>
        </thead>
    </table>

    <script>

        var mydata =<%=baseDatosJson%>;

        $(function () {
            $('#table').bootstrapTable({
                data: mydata,
                detailView: true,
                detailFilter: function (index, row) {
                    return row.hijo != null;
                },
                onExpandRow: function (index, row, $detail) {
                    if (row.hijo != null)
                        expandirTabla(index, row, $detail);
                }
            });
            $('#table')[0].classList.value = "table table-bordered";
            if (mydata.colorEncabezado != null && mydata.colorEncabezado != "")
                $('#table')[0].tHead.style = "background-color:" + row.colorEncabezado;
        });

        function expandirTabla(index, row, $detalle) {
            if (row.hijo != null && row.hijo.length > 0) {
                var $el = $detalle.html('<table></table>').find('table')
                var i; var j; var row
                var columns = []
                var data = []
                var rows = row.hijo.length;
                var columnas = 0;

                if (rows > 0) {
                    columnas = Object.keys(row.hijo[0]).filter(fila => fila != "hijo" && fila != "colorEncabezado");
                }
                else
                    return;

                for (i = 0; i < columnas.length; i++) {
                    var alineacion = "center";
                    if (columnas[i] == "%")
                        alineacion = "right";
                    else
                        alineacion = typeof (eval("row.hijo[i]." + columnas[i])) == "number" ? "right" : "center";

                    columns.push({
                        field: columnas[i],
                        title: columnas[i],
                        sortable: true,
                        align: alineacion
                    })
                }

                for (i = 0; i < rows; i++) {
                    var rowtmp = row.hijo[i];
                    data.push(rowtmp)
                }

                $el.bootstrapTable({
                    columns: columns,
                    data: data,
                    detailView: true,
                    detailFilter: function (index, row) {
                        return row.hijo != null;
                    },
                    onExpandRow: function (index, row, $detail) {
                        /* eslint no-use-before-define: ["error", { "functions": false }]*/
                        expandirTabla(index, row, $detail)
                    }
                })
                $el[0].classList.value = "table  table-bordered";

                if (row.colorEncabezado != null && row.colorEncabezado != "")
                    $el[0].tHead.style = "background-color:" + row.colorEncabezado;
            }
        }

    </script>
</asp:Content>
