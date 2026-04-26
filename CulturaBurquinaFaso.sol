// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaBurquinaFaso
 * @dev Cierre de la serie: Gestion de absorcion de grasas y potenciadores naturales.
 * Serie: Sabores de Africa (55/55)
 */
contract CulturaBurquinaFaso {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 absorcionLipidica;    // Capacidad del grano de absorber grasa (1-100)
        uint256 intensidadUmami;      // Nivel de Soumbala/condimento (1-10)
        bool usaNereAncestral;        // Validador de ingrediente base (Nere)
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Riz Gras (Ingenieria de la Absorcion)
        registrarPlato(
            "Riz Gras", 
            "Arroz, aceite, tomate, cebolla, carne, soumbala.",
            "Coccion del arroz directamente en una emulsion de grasa y caldo para saturar el grano.",
            95, 
            8, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _absorcion, 
        uint256 _umami,
        bool _nere
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            absorcionLipidica: _absorcion,
            intensidadUmami: _umami,
            usaNereAncestral: _nere,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
