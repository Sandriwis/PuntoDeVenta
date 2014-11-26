using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Libreria
{
    public class Marca: Conectar, IOperaciones
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private String nombre;

        public String Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private Boolean activo; 

        public Boolean Activo
        {
            get { return activo; }
            set { activo = value; }
        }

        // implementar metodos de la interface


        public int grabar()
        {
            int resultado = 0;
            String sql = "P_GRABARMARCA " + Id + ",'" + Nombre + "'," + Activo + "";
            resultado = grabarConReturn(sql);
            return resultado;
        }

        public System.Data.DataSet listar()
        {
            string sql = "P_LISTARMARCA '" + Nombre + "'";
            return listar(sql);
        }

        public void leer()
        {
            throw new NotImplementedException();
        }

        public void limpiar()
        {
            Id = 0;
            Nombre = "";
            Activo = false;
        }
        public Boolean existe()
        {
            String sql = "P_EXISTEMARCA " + Id + ",'" +
                                            Nombre + "'";
            return grabarConReturn(sql) != 0 ? true : false;

        }

        public DataSet llenarComboBox()
        {
            string sql = "P_LLENARCOMBOMARCA";
            return listar(sql);
        
        }




    }
}
