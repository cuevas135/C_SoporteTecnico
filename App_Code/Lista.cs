using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

/// <summary>
/// Descripción breve de Lista
/// </summary>
public class Lista
{
	public Lista()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

 
    public byte[] imageToByteArray(System.Drawing.Image imageIn)
    {
        MemoryStream ms = new MemoryStream();
        imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
        return ms.ToArray();
    }

    //public bool Verifica_Datos_Tabla_2(DataTable t, string Estado)
    //{
    //    bool ok = false;
    //    if (t == null)
    //    {
    //        ok = false;
    //    }
    //    else if (t.Rows.Count == 0)
    //    {
    //        ok = false;
    //    }

    //    for (int i = 0; i < t.Rows.Count; i++)
    //    {
    //        //columna nro 2 -> TipoComprobante.
    //        //columna nro 5 -> Estado.
    //        //ok = t.Rows[i].ItemArray[2].ToString().Trim() == TipoComprobante;
    //        ok = t.Rows[i].ItemArray[15].ToString().Trim() == Estado;
    //        if (ok == true)
    //        {
    //            ok = true;
    //            break;
    //        }
    //    }
    //    return ok;
    //}
    public void Ocultar_Columnas(System.Web.UI.WebControls.Table tabla, params object[] columnas)
    {
        for (int i = 0; i < tabla.Rows.Count; i++){
            for (int j = 0; j < columnas.Length; j++){
                tabla.Rows[i].Cells[(int)columnas[j]].Visible = false;
            }
        }
    }
    public void Cuadricula(System.Web.UI.WebControls.Table tabla, int nrofilas, int nrocolumnas)
    {
        System.Web.UI.WebControls.TableRow tRow;
        for (int i = 0; i < nrofilas; i++){
            tRow = new TableRow();
            for (int j = 0; j < nrocolumnas; j++)//Cabecera de la tabla
            {
                TableCell tCell = new TableCell();
                tCell.Text = "";
                tCell.Height = 16;
                tCell.HorizontalAlign = HorizontalAlign.Left;
                tCell.Visible = true;
                tRow.Cells.Add(tCell);}
            tRow.Visible = false;
            tabla.Rows.Add(tRow);
        }
    }
    public bool Verifica_Datos_Fila_Cuadricula(System.Web.UI.WebControls.Table tabla, params object[] columnas)
    {
        bool ok = true;
        bool flag = false;
        for (int i = 1; i < tabla.Rows.Count; i++){
            for (int j = 0; j < columnas.Length; j++){
                if (tabla.Rows[i].Visible == true){
                    ok = ok && tabla.Rows[i].Cells[(int)columnas[j]].Text.Trim() != "";
                    flag = true;
                }
            }
        }
        if (flag == false){
            ok = false;
        }
        return ok;
    }


    public int Obtener_Numero_Fila_Blanco(System.Web.UI.WebControls.Table tabla, int nrocolumna)
    {
        int fila = 0;
        for (int i = 1; i < tabla.Rows.Count; i++)
        {
            if (tabla.Rows[i].Cells[nrocolumna].Text.Trim() == "")
            {
                fila = i;
                break;
            }
        }
        return fila;
    }
    public void Busca(System.Web.UI.WebControls.DropDownList control, String Text)
    {
        for (int i = 0; i < control.Items.Count; i++){
            if (control.Items[i].Text.Trim().Equals(Text)){
                control.SelectedIndex = i;}
        }
    }

    public bool Verifica_Datos_Tabla(DataTable t)
    {
        bool ok = true;
        if (t == null)
        {
            ok = false;
        }
        else if (t.Rows.Count == 0)
        {
            ok = false;
        }
        for (int i = 0; i < t.Rows.Count; i++)
        {
            for (int j = 0; j < t.Columns.Count - 2; j++)
            {
                ok = ok && t.Rows[i].ItemArray[j].ToString().Trim() != "";
            }
        }
        return ok;
    }

    public bool Validar_Datos_Tabla(DataTable t, object[,] datosvalidar)
    {
        bool ok = true;
        if (t.Rows.Count > 0){
            object[,] r = datosvalidar;
            object[] c = (object[])datosvalidar[0, 0];
            object[] d = (object[])datosvalidar[0, 1];
            for (int i = 0; i < t.Rows.Count; i++){
                if (ok == false){
                    ok = true;
                }

                for (int j = 0; j < c.Length; j++){
                    ok = ok && t.Rows[i].ItemArray[(int)c[j]].ToString().Trim() == d[j].ToString();
                }
                if (ok == true){
                    break;
                }
            }
        }
        else{
            ok = false;
        }
        return ok;
    }

    public bool Validar_Editar_Datos_Tabla(DataTable t, object[,] datosvalidar, int filaeditar)
    {
        bool ok = true;
        object[,] r = datosvalidar;
        object[] c = (object[])datosvalidar[0, 0];
        object[] d = (object[])datosvalidar[0, 1];
        for (int i = 0; i < t.Rows.Count; i++){
            if (i != filaeditar){
                if (ok == false){
                    ok = true;}
                for (int j = 0; j < c.Length; j++){
                    ok = ok && t.Rows[i].ItemArray[(int)c[j]].ToString().Trim() == d[j].ToString();
                }
                if (ok == true){
                    break;
                }
            }
            else {
                ok = false;}
        }
        return ok;
    }
    public DataTable Eliminar_Fila_Tabla_Datos(DataTable dt, int fila){
        DataRow FilaTabla = dt.Rows[fila];//obtenemos la fila de la fuente de datos.
        dt.Rows.Remove(FilaTabla);//eliminamos la fila de la fuente de datos.
        return dt;}

    public DataTable Crear_Cabecera_Grilla(params object[] columnas)
    {
        DataTable dt = new DataTable();
        object[] fila = new object[columnas.Length];
        for (int i = 0; i < columnas.Length; i++){
            fila[i] = "";
            dt.Columns.Add(columnas[i].ToString());}
        dt.Rows.Add(fila);
        return dt;
    }

    public DataTable Crear_Cabecera_Grilla_2(params object[] columnas)
    {
        DataTable dt = new DataTable();
        for (int i = 0; i < columnas.Length; i++){
            dt.Columns.Add(columnas[i].ToString()); }
        dt.Rows.Add();
        return dt;
    }

    //===================================== AGREGADO EL DIA 17-09-2017 ===============================
    // =============================== PARA CONTROL DE ACCESOS =========================================
    public bool verifica_seleccion_autorizacion_formulario_derecho_2(System.Web.UI.WebControls.Table tabla, int NroColumna)
    {
        bool ok = ((System.Web.UI.WebControls.CheckBox)tabla.Rows[1].Cells[NroColumna].Controls[0]).Checked;
        return ok;
    }

    public bool verifica_seleccion_autorizacion_formulario_3(System.Web.UI.WebControls.Table tabla, int NroColumna)
    {
        bool ok = true;
        for (int i = 2; i < tabla.Rows.Count; i++){
            if (((System.Web.UI.WebControls.CheckBox)tabla.Rows[i].Cells[NroColumna].Controls[0]).Checked == false)
            {
                ok = true;
                for (int j = 4; j < tabla.Rows[i].Cells.Count; j++)
                {
                    if (((System.Web.UI.WebControls.CheckBox)tabla.Rows[i].Cells[j].Controls[0]).Checked == true)
                    {
                        ok = false;
                    }
                }
            }
            if (ok == false){
                break;
            }
        }
        return ok;
    }

    public bool verifica_seleccion_autorizacion_formulario_2(System.Web.UI.WebControls.Table tabla, int NroColumna)
    {
        bool ok = true;
        for (int i = 2; i < tabla.Rows.Count; i++)
        {
            if (((System.Web.UI.WebControls.CheckBox)tabla.Rows[i].Cells[NroColumna].Controls[0]).Checked == true)
            {
                ok = false;
                for (int j = 4; j < tabla.Rows[i].Cells.Count; j++){
                    if (((System.Web.UI.WebControls.CheckBox)tabla.Rows[i].Cells[j].Controls[0]).Checked == true)
                    {
                        ok = true;
                    }
                }
            }
            if (ok == false)
            {
                break;
            }
        }
        return ok;
    }

    public bool verifica_seleccion_autorizacion_formulario(System.Web.UI.WebControls.Table tabla, int NroColumna)
    {
        bool ok = false;
        for (int i = 1; i < tabla.Rows.Count; i++){
            System.Web.UI.WebControls.CheckBox check = (System.Web.UI.WebControls.CheckBox)tabla.Rows[i].Cells[NroColumna].Controls[0];
            if (check.Checked == true)
            {
                ok = true;
            }
        }
        return ok;
    }

    // =============================== *** FIN *** =========================================
    public void Search_DropDownList(DataTable Tabla, System.Web.UI.WebControls.DropDownList control, String strcampo)
    {
        if (Tabla.Rows.Count == 0) return;
        for (int i = 0; i < control.Items.Count; i++){
            if (control.Items[i].Text.Trim().Equals(Tabla.Rows[0][strcampo].ToString())){
                control.SelectedIndex = i;}
        }
    }

    public void ShowMessage(System.Web.UI.WebControls.HiddenField __mensaje, System.Web.UI.WebControls.HiddenField __pagina, string msg, string paginaweb)
    {
        __mensaje.Value = msg;
        __pagina.Value = paginaweb;
    }
}