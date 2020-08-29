using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Diana
{
    public partial class _Default : Page
    {
        public string baseDatosJson = "[" +
                    "   {" +
                    "       \"Concepto\": \"FACTURACIÓN\"," +
                    "       \"Importe\": \"__importeFacturacion__\"," +
                    "       \"%\": \"__porcentajeFacturacion__\"," +
                    "       \"hijo\": [" +
                    "       {" +
                    "           \"Concepto\": \"ALQUILERES\"," +
                    "           \"Importe\": \"__importeAlquiler__\"," +
                    "           \"%\": \"__porcentajeAlquiler__\"," +
                    "           \"colorEncabezado\": \"red\"," +
                    "           \"hijo\": [" +
                    "           {" +
                    "               \"Concepto\": \"PRODUCTOS\"," +
                    "               \"Importe\": \"__importeAlquilerProducto__\"," +
                    "               \"%\": \"__porcentajeAlquilerProducto__\"" +
                    "           }," +
                    "           {" +
                    "               \"Concepto\": \"SERVICIOS\"," +
                    "               \"Importe\": \"__importeAlquilerServicio__\"," +
                    "               \"%\": \"__porcentajeAlquilerServicio__\"" +
                    "           }" +
                    "           ]" +
                    "       }," +
                    "       {" +
                    "           \"Concepto\": \"VENTAS\"," +
                    "           \"Importe\": \"__importeVenta__\"," +
                    "           \"%\": \"__porcentajeVenta__\"," +
                    "           \"colorEncabezado\": \"yellow\"," +
                    "           \"hijo\": [" +
                    "           {" +
                    "               \"Concepto\": \"PRODUCTOS\"," +
                    "               \"Importe\": \"__importeVentaProducto__\"," +
                    "               \"%\": \"__porcentajeVentaProducto__\"" +
                    "           }," +
                    "           {" +
                    "               \"Concepto\": \"SERVICIOS\"," +
                    "               \"Importe\": \"__importeVentaServicio__\"," +
                    "               \"%\": \"__porcentajeVentaServicio__\"" +
                    "           }" +
                    "           ]" +
                    "       }" +
                    "       ]" +
                    "   }" +
                    "]";

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}