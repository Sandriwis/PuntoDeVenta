using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Libreria
{
    public class FormaPago : Conectar, IOperaciones
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
        private Boolean habilitado;

        public Boolean Habilitado
        {
            get { return habilitado; }
            set { habilitado = value; }
        }

        
      

        public int grabar()
        {
            String sql = "P_GRABARFORMAPAGO " + Id + ",'" +
                                                Nombre + "'," +
                                                (Habilitado ? 1 : 0);
            return grabarConReturn(sql);
        }

        public DataSet listar()
        {
            String sql = "P_LISTARFORMAPAGO '" + Nombre + "'";
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
            habilitado = false;
        }

        public Boolean existe()
        {
            String sql = "P_EXISTEFORMAPAGO " + Id + ",'" +
                                                Nombre + "'";
            return grabarConReturn(sql) != 0 ? true : false;
        }











    }
}
