<?php

class ExtraModel{
    public $enlace;
    public function __construct() {       
        $this->enlace=new MySqlConnect();       
    }
     /*Obtener */
     public function getExtraByUser($id)
     {
         try {
             //Consulta sql
             $vSql = "SELECT E.idExtra, E.nombre, E.precio, AE.cantidad FROM extra E
             LEFT JOIN alquiler_extra AE 
             ON AE.idAlquiler = $id
             WHERE E.idExtra = AE.idExtra
             GROUP BY E.idExtra;";
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