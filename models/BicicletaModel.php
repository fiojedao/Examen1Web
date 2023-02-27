<?php

class BicicletaModel{
    public $enlace;
    public function __construct() {
        $this->enlace=new MySqlConnect();
    }
    /*Obtener */
    public function get($id)
    {
        try {
            //Consulta sql
            $vSql = "SELECT * FROM bicicleta where idBicicleta=$id";
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