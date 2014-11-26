using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Libreria
{
    public class Categoria : Conectar, IOperaciones
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


        public int grabar()
        {
            String sql = "P_GRABARCATEGORIA " + Id + ",'" +
                                                Nombre + "'," +
                                                (Activo ? 1 : 0);
            return grabarConReturn(sql);            
        }

        public DataSet listar()
        {
            String sql = "P_LISTARCATEGORIA '" + Nombre + "'";
            return listar(sql);
        }

        public void leer()
        {
            throw new NotImplementedException();
        }

        public void limpiar()
        {
            id = 0;
            nombre = "";
            activo = false;
        }

        public Boolean existe()
        {
            String sql = "P_EXISTECATEGORIA " + Id + ",'" + 
                                                Nombre + "'";
            return grabarConReturn(sql) != 0 ? true : false;
        }



        public DataSet llenarComboBox()
        {
            string sql = "P_LLENARCOMBOCATEGORIA";
            return listar(sql);

        }

    }
}
