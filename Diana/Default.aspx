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
                <th data-field="id">ID</th>
                <th data-field="name">Item Name</th>
                <th data-field="price">Item Price</th>
            </tr>
        </thead>
    </table>

    <script>
        
        var mydata =
            [
                {
                    "id": 0,
                    "name": "test0",
                    "price": "$0",
                    "hijo": [
                        {
                            "id": 1,
                            "name": "test1",
                            "price": "$1"
                        },
                        {
                            "id": 1,
                            "name": "test2",
                            "price": "$2",
                            "hijo": [
                                {
                                    "id": 1,
                                    "name": "test1",
                                    "price": "$1"
                                },
                                {
                                    "id": 1,
                                    "name": "test2",
                                    "price": "$2",
                                    "hijo": [
                                        {
                                            "id": 1,
                                            "name": "test1",
                                            "price": "$1"
                                        },
                                        {
                                            "id": 1,
                                            "name": "test2",
                                            "price": "$2"
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    "id": 1,
                    "name": "test1",
                    "price": "$1"
                }
            ];

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
                    columnas = Object.keys(row.hijo[0]);
                }
                else
                    return;

                for (i = 0; i < columnas.length; i++) {
                    columns.push({
                        field: columnas[i],
                        title: columnas[i],
                        sortable: true
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
            }
        }        

    </script>
</asp:Content>
