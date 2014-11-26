using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace Libreria
{
    public class Conectar
    {
        private const String cadena = @"Data Source=.\SQLEXPRESS;" +
                                       @"AttachDbFileName='C:\Users\Sandra\Desktop\ProyectoPuntoDeVenta_S2_V5_ Karen Campos\ProyectoPuntoDeVenta_S2\PuntoDeVentas\PuntoDeVentas\App_Data\PuntoDeVenta.mdf';" +
                                       "Integrated Security=True;" +
                                       "User Instance=True;";

        protected DataSet listar(String sqlString)
        {
            DataSet dataSet = new DataSet();
            try
            {
                System.Data.SqlClient.SqlConnection conexion = new SqlConnection(cadena);
                SqlDataAdapter adapter = new SqlDataAdapter(sqlString.ToUpper(), conexion);
                adapter.Fill(dataSet);
            }
            catch (Exception e)
            {
                dataSet = null;
            }
            return dataSet;
        }
        protected int grabarConReturn(String sqlString)
        {
            int resultado = 0; // no ejecutado
            try
            {
                using (SqlConnection conexion = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand(sqlString.ToUpper(), conexion);
                    cmd.CommandType = CommandType.Text;
                    conexion.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    rdr.Read();
                    resultado = Int32.Parse(rdr.GetValue(0).ToString());
                    conexion.Close();
                    return resultado;
                }
            }
            catch (Exception e)
            {
                resultado = -1; // error
            }
            return resultado; // nro >0 ejecución correcta, nro <0 error
        }

        protected int grabar(String sqlString)
        {
            int huboError = 0; // ocurrio un error 
            try
            {
                sqlString = sqlString.ToUpper();
                SqlConnection conexion = new SqlConnection(cadena);
                SqlCommand comando = new SqlCommand(sqlString.ToUpper(), conexion);
                conexion.Open();
                huboError = comando.ExecuteNonQuery();
                conexion.Close();
            }
            catch (Exception e)
            {

            }
            return huboError;
        }
    }
}
