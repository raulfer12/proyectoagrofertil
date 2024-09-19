<?php

namespace Dao\Mnt;

class Media extends \Dao\Table
{
    public static function getAll($ProductoId)
    {
        $sqlstr = "Select * from media_agrofertil where ProductoId=:ProductoId;";
        return self::obtenerRegistros($sqlstr, array("ProductoId"=>$ProductoId));
    }

    public static function insert($MediaDoc, $MediaPath)
    {
        $ProductoId = self::obtenerRegistros("Select max(ProductoId) as ProductoId from productos;", array());

        foreach($ProductoId as $item){
            $ProductoId = $item["ProductoId"];
        }
        
        $insstr = "INSERT INTO media_agrofertil (MediaDoc, MediaPath, ProductoId) values (:MediaDoc, :MediaPath, :ProductoId);";
        return self::executeNonQuery(
            $insstr,
            array(
                "MediaDoc"=>$MediaDoc,
                "MediaPath"=>$MediaPath,
                "ProductoId"=>$ProductoId
            )
        );
    }

    public static function update($MediaDoc, $MediaPath, $ProductoId)
    {
        $updsql = "INSERT INTO media_agrofertil (MediaDoc, MediaPath, ProductoId) values (:MediaDoc, :MediaPath, :ProductoId);";
        return self::executeNonQuery(
            $updsql,
            array(
                "MediaDoc"=>$MediaDoc,
                "MediaPath"=>$MediaPath,
                "ProductoId"=>$ProductoId,
            )
        );
    }

    public static function delete($ProductoId, $MediaId)
    {
        $delsql = "DELETE from media_agrofertil where ProductoId=:ProductoId and MediaId=:MediaId;";
        return self::executeNonQuery(
            $delsql,
            array(
                "ProductoId" => $ProductoId,
                "MediaId" => $MediaId
            )
        );
    }

}
?>
