using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Libreria
{
    interface IOperaciones
    {
        int grabar();
        DataSet listar();
        void leer();
        void limpiar();
        Boolean existe();
    }
}
