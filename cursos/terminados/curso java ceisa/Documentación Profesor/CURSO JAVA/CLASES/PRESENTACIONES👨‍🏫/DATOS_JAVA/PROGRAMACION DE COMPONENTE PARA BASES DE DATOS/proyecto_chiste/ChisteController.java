package com.asehca.proyecto6.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.asehca.proyecto6.model.Chiste;
import com.asehca.proyecto6.service.ChisteService;



@RestController
public class ChisteController {

    private final ChisteService chisteService;

    public ChisteController(ChisteService chisteService) {
        this.chisteService = chisteService;
    }

    @GetMapping("/chisteazar")
    public Chiste chisteazar() {
        Chiste chisteAzar = chisteService.obtenerChisteAleatorio();        
        return chisteAzar;
    }
    
    @GetMapping("/chistetodos")
    public List <Chiste> chisteTodos() {
        List<Chiste> chistes=chisteService.todos();
        return chistes;
    }
    
}
