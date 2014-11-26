using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Libreria
{
   public class Producto:Conectar,IOperaciones
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private int idMarca;

        public int IdMarca
        {
            get { return idMarca; }
            set { idMarca = value; }
        }
        private int idCategoria;

        public int IdCategoria
        {
            get { return idCategoria; }
            set { idCategoria = value; }
        }
        private int codigoBarra;

        public int CodigoBarra
        {
            get { return codigoBarra; }
            set { codigoBarra = value; }
        }
        private String nombre;

        public String Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private String descripcion;

        public String Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
        private Decimal precioVenta;

        public Decimal PrecioVenta
        {
            get { return precioVenta; }
            set { precioVenta = value; }
        }
        private Decimal precioCosto;

        public Decimal PrecioCosto
        {
            get { return precioCosto; }
            set { precioCosto = value; }
        }
        private Decimal stock;

        public Decimal Stock
        {
            get { return stock; }
            set { stock = value; }
        }
        private Boolean execto;

        public Boolean Execto
        {
            get { return execto; }
            set { execto = value; }
        }
        private Boolean habilitado;

        public Boolean Habilitado
        {
            get { return habilitado; }
            set { habilitado = value; }
        }


        public int grabar()
        {
            int resultado = 0;
            String sql = "P_GRABARPRODUCTO " + Id + "," +
                IdMarca + "," +
                IdCategoria + "," + 
                CodigoBarra + ",'" + 
                Nombre + "','" +
                Descripcion + "'," + 
                PrecioVenta.ToString().Replace(",",".") + "," +
                PrecioCosto.ToString().Replace(",", ".") + "," +
                Stock.ToString().Replace(",", ".") + "," + 
                Execto + ", " + 
                Habilitado + "";
            resultado = grabarConReturn(sql);
            return resultado;
        }

        public System.Data.DataSet listar()
        {
            string sql = "P_LISTARPRODUCTO '" + CodigoBarra + "'";
            return listar(sql);
        }

        public void leer()
        {
            throw new NotImplementedException();
        }

        public void limpiar()
        {
            Id = 0;
            IdMarca = 0;
            IdCategoria = 0;
            CodigoBarra = 0;
            Nombre = "";
            Descripcion = "";
            PrecioVenta = 0;
            PrecioCosto = 0;
            Stock = 0;
            Execto = false;
            Habilitado = false;



        }
        public Boolean existe()
        {
            String sql = "P_EXISTEPRODUCTO " + Id + ",'" +
                                            CodigoBarra + "'";
            return grabarConReturn(sql) != 0 ? true : false;

        }

    }
}
