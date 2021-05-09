
import * as React from 'react';
import { FlatList, Text, View } from 'react-native';
import { Avatar, IconButton, Button, TextInput } from 'react-native-paper';
import { Component } from 'react';
import { Overlay, Card } from 'react-native-elements';
import ListGroup from 'react-bootstrap/ListGroup'
import { ListGroupItem } from 'react-bootstrap';

//type Props = {};
export default class Lista extends Component{

    constructor(props){
        
        super();
        this.state = {
            text: "", 
            itens:[
                {key:1, desc:"Cesta básica", user:"Fernando", don:false, img:"'../assets/images/avatar.png'", type:"Alimento"},
                {key:2, desc:"Frauda geriátrica", user:"Tom", don:false, img:"'../assets/images/avatar.png'", type:"Higiene"},
                {key:2, desc:"PC gamer", user:"Bruno", don:false, img:"'../assets/images/avatar.png'", type:"Acessório"},
                {key:2, desc:"Abrigo temporário", user:"Samuel", don:false, img:"'../assets/images/avatar.png'", type:"Auxílio direto"},
                {key:2, desc:"Ajuda Psicológica", user:"Maria Joaquina", don:false, img:"'../assets/images/avatar.png'", type:"Auxílio direto"},
                {key:2, desc:"Frauda geriátrica", user:"Cirílo", don:false, img:"'../assets/images/avatar.png'", type:"Higiene"},

            ]
        }

    };

    renderItem(obj){
        var url = obj.item.img;
        return(
            <ListGroup.Item action onClick={() => console.log('Pressed')} style={style.cell}>
                <View style={style.cell}>
                        <Avatar.Image style={style.title} size={40} 
                        source={require('../assets/images/avatar.png')}/>
                        <text style={style.title}>{obj.item.user}</text>
                        <text style={style.cell}>{obj.item.desc}</text>        
                </View>
            </ListGroup.Item>
        )
    } 
    render() {
        return (
            <ListGroup defaultActiveKey="#link1">
                <View style={style.container}>
                    <FlatList style={style.list} data={this.state.itens} renderItem={this.renderItem}/>
                </View>
            </ListGroup>
        );
    };
};

const style = {
    container:{
        marginTop: 24,
      },
    cell:{paddingTop: 20,
        paddingBottom: 20,
        backgroundColor: "#E4EBEE",
        fontSize: 18,
        marginBottom: 2,
        marginRight: 10,
        marginLeft: 10,
        borderRadius:20,
    },
    list:{

    },
    input:{
        backgroundColor:"white",
        borderColor:"#CCC",
        borderWidth:3,
        padding:10,
        margin:20,
    },
    title:{
        fontSize:20,
        marginRight: 10,
        marginBottom: 2,
        marginLeft: 10,
    }
};


