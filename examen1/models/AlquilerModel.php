<?php

class AlquilerModel{
    public $enlace; 
    public function __construct() {
        $this->enlace=new MySqlConnect();
    }
    /*Listar */
    public function all(){
        try {
            //Consulta sql
            $vSql = "SELECT * FROM alquiler_bicicleta.alquiler order by fecha ASC;";
            $this->enlace->connect();
            //Ejecutar la consulta
            $vResultado = $this->enlace->ExecuteSQL ($vSql);
                
            // Retornar el objeto
            return $vResultado;
        } catch ( Exception $e ) {
            die ( $e->getMessage () );
        }
    }
    /*Obtener */
    public function get($id)
    {
        try {
            $usuariom=new UsuarioModel();
            $bicicletam=new BicicletaModel();
            $extram=new ExtraModel();
            $tarifam=new TarifaModel();

			$vSql = "SELECT * FROM alquiler WHERE idAlquiler=$id";
			$this->enlace->connect();
			$vResultado = $this->enlace->ExecuteSQL ( $vSql);
            $vResultado = $vResultado[0];
            
            $usuario=$usuariom->get($vResultado->idUsuario);
            $vResultado->usuario=$usuario;

            $bicicleta=$bicicletam->get($vResultado->idBicicleta);
            $vResultado->bicicleta=$bicicleta;

            $tarifa=$tarifam->get($vResultado->idTarifa);
            $vResultado->tarifa=$tarifa;

            $extra=$extram->getExtraByUser($id);
            $vResultado->extras=$extra;

            //$vResultado->costo=$this->calculoTotal($extra, $tarifa[0]->precio);

			return $vResultado;
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }

    /*Obtener */
    public function calculoTotal($extras, $tarifa)
    {
        try {
            $extra = null;

            foreach($extras as $extr){
                $extra += ($extr->precio) * ($extr->cantidad);
            }

            return $tarifa + $extra;
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }
    public function create($objeto) {
        try {
            $tarifam=new TarifaModel();
            $extram=new ExtraModel();

            $tarifa=$tarifam->get($objeto->idTarifa);
            $extra=$extram->getExtraByUser($objeto->idUsuario);
            $total = $this->calculoTotal($extra, $tarifa[0]->precio);

            $this->enlace->connect();
			$sql = "INSERT INTO alquiler (fecha, idUsuario, idBicicleta, idTarifa, total)
             VALUES('$objeto->fecha','$objeto->idUsuario','$objeto->idBicicleta','$objeto->idTarifa','$total')";
			
			$idAlquiler = $this->enlace->executeSQL_DML_last( $sql);
                
            foreach($objeto->extras as $row){
                $this->enlace->connect();
                $valores=implode(',', $row);
                $sql = "INSERT INTO alquiler_extra(idAlquiler,idExtra,cantidad) VALUES($idAlquiler,".$valores.");";
                $vResultado = $this->enlace->executeSQL_DML($sql);
            }
            return $this->get($idAlquiler);
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }public function update($objeto) {
        try {
            //Consulta sql
            $this->enlace->connect();
			$sql = "UPDATE alquiler SET fecha ='$objeto->fecha',idUsuario ='$objeto->idUsuario',idBicicleta ='$objeto->idBicicleta',idTarifa ='$objeto->idTarifa',total ='$objeto->total' Where idAlquiler=$objeto->idAlquiler";
			
			$cResults = $this->enlace->executeSQL_DML( $sql);
            $this->enlace->connect();
			$sql = "Delete from alquiler_extra Where idAlquiler=$objeto->idAlquiler";
			$cResults = $this->enlace->executeSQL_DML( $sql);
                
            foreach($objeto->extras as $row){
                $this->enlace->connect();
                $valores=implode(',', $row);
                $sql = "INSERT INTO alquiler_extra(idAlquiler,idExtra,cantidad) VALUES($objeto->idAlquiler,".$valores.");";
                $vResultado = $this->enlace->executeSQL_DML($sql);
            } 
            
            $tarifam=new TarifaModel();
            $extram=new ExtraModel();

            $tarifa=$tarifam->get($objeto->idTarifa);
            $extra=$extram->getExtraByUser($objeto->idUsuario);
            $total = $this->calculoTotal($extra, $tarifa[0]->precio);

            $this->enlace->connect();
			$sql = "UPDATE alquiler SET total ='$total'
            Where idAlquiler=$objeto->idAlquiler";
			
			$cResults = $this->enlace->executeSQL_DML( $sql);

            return $this->get($objeto->idAlquiler);
		} catch ( Exception $e ) {
			die ( $e->getMessage () );
		}
    }
}
?>