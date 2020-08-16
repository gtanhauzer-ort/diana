<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Diana._Default" %>

<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeaderContent" runat="server">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.css">
    <script src="https://unpkg.com/bootstrap-table@1.17.1/dist/bootstrap-table.min.js"></script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <table id="table" data-detail-view="true">
        <thead>
            <tr class="table-info">
                <th data-field="id">ID</th>
                <th data-field="name">Item Name</th>
                <th data-field="price">Item Price</th>
            </tr>
        </thead>
    </table>

    <script>

        var $table = $('#table');
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
                            "name": "test1",
                            "price": "$1"
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
                onExpandRow: function (index, row, $detail) {                    
                    expandirTabla(index, row, $detail);
                }
            });
        });

        function expandirTabla(index, row, $detalle) {   
            if (row.hijo != null && row.hijo.length > 0) {
                var $el = $detalle.html('<table></table>').find('table')
                var i; var j; var row
                var columns = []
                var data = []
                var cells = 3;
                var rows = row.hijo.length;
                for (i = 0; i < cells; i++) {
                    columns.push({
                        field: 'field' + i,
                        title: 'Cell' + i,
                        sortable: true
                    })
                }
                for (i = 0; i < rows; i++) {
                    row = {}
                    for (j = 0; j < cells; j++) {
                        row['field' + j] = row.hijo[rows];
                    }
                    data.push(row)
                }
                $el.bootstrapTable({
                    //columns: columns,
                    data: data,
                    //detailView: cells > 1,
                    onExpandRow: function (index, row, $detail) {
                        /* eslint no-use-before-define: ["error", { "functions": false }]*/
                        expandirTabla($detail)
                    }
                })
            }
        }
        var $table = $('#table')

        function buildTable($el, cells, rows) {
            var i; var j; var row
            var columns = []
            var data = []

            for (i = 0; i < cells; i++) {
                columns.push({
                    field: 'field' + i,
                    title: 'Cell' + i,
                    sortable: true
                })
            }
            for (i = 0; i < rows; i++) {
                row = {}
                for (j = 0; j < cells; j++) {
                    row['field' + j] = 'Row-' + i + '-' + j
                }
                data.push(row)
            }
            $el.bootstrapTable({
                columns: columns,
                data: data,
                detailView: cells > 1,
                onExpandRow: function (index, row, $detail) {
                    /* eslint no-use-before-define: ["error", { "functions": false }]*/
                    expandTable($detail, cells - 1)
                }
            })
        }

        function expandTable($detail, cells) {
            buildTable($detail.html('<table></table>').find('table'), cells, 1)
        }

    </script>
</asp:Content>
