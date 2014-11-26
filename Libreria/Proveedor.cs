using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Libreria
{
    public class Proveedor:Conectar, IOperaciones
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private int rut;

        public int Rut
        {
            get { return rut; }
            set { rut = value; }
        }
        private char digito;

        public char Digito
        {
            get { return digito; }
            set { digito = value; }
        }
        private String razonsocial;

        public String Razonsocial
        {
            get { return razonsocial; }
            set { razonsocial = value; }
        }
        private String nombre;

        public String Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private String fono1;

        public String Fono1
        {
            get { return fono1; }
            set { fono1 = value; }
        }
        private String fono2;

        public String Fono2
        {
            get { return fono2; }
            set { fono2 = value; }
        }
        private String email;

        public String Email
        {
            get { return email; }
            set { email = value; }
        }
        private Boolean activo;

        public Boolean Activo
        {
            get { return activo; }
            set { activo = value; }
        }


        public int grabar()
        {
            int resultado = 0;
            String sql = "P_GRABARPROVEEDOR " + Id + ",'" + Rut + "'," + Digito + ",'" + Razonsocial + "','" + Nombre + "','" + Fono1 + "','" + Fono2 + "','" + Email + "','" + Activo + "'";
            resultado = grabarConReturn(sql);
            return resultado;
        }

        public System.Data.DataSet listar()
        {
            string sql = "P_LISTARPROVEEDOR '" + Razonsocial + "'";
            return listar(sql);
        }

        public void leer()
        {
            throw new NotImplementedException();
        }

        public void limpiar()
        {
            Id = 0;
            Rut = 0;
            Digito = ' ';
            Razonsocial="";
            Nombre="";
            Fono1="";
            Fono2="";
            Email="";
            Activo=false;



        }
        public Boolean existe()
        {
            String sql = "P_EXISTEPROVEEDOR " + Id + ",'" +
                                            Razonsocial + "'";
            return grabarConReturn(sql) != 0 ? true : false;

        }



    }
}
