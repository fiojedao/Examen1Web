<?php

class UsuarioModel{
	public $enlace;
    public function __construct() {
        $this->enlace=new MySqlConnect();
       
    }
    /*Obtener */
    public function get($id)
    {
        try {
            //Consulta sql
            $vSql = "SELECT * FROM usuario where idUsuario=$id";
            $this->enlace->connect();
            //Ejecutar la consulta
            $vResultado = $this->enlace->ExecuteSQL ( $vSql);
            // Retornar el objeto
            return $vResultado;
        } catch ( Exception $e ) {
            die ( $e->getMessage () );
        }
    }

}
?>