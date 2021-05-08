import * as React from 'react';
import { createStackNavigator } from '@react-navigation/stack';

import Login from './components/login';
import Signup from './components/signup';
import Dashboard from './components/dashboard';

import { NavigationContainer } from '@react-navigation/native';
import { Provider as PaperProvider } from 'react-native-paper';
import { createMaterialBottomTabNavigator } from '@react-navigation/material-bottom-tabs';
import customTheme from './component/themes';


const customTheme = {
  ...PaperDefaultTheme,
  ...NavigationDefaultTheme,
  colors: {
    ...PaperDefaultTheme.colors,
    ...NavigationDefaultTheme.colors,
    primary: '#63dadb',
    accent: '#2f2d2a',
    background: '#fff',
    backdrop: '#fff',
    titleColor: '#44444C',
  },
};

const Stack = createStackNavigator();

function MyStack() {
  return (
    <PaperProvider theme={customTheme}>
      <NavigationContainer theme={customTheme}>
        <Stack.Navigator
          initialRouteName="Home">
          <Stack.Screen name="Login" component={Login}  options={{headerShown:false}}/>
          <Stack.Screen name="Signup" component={Signup} options={{headerShown:false}} />
          <Stack.Screen name="Dashboard" component={Dashboard} />
        </Stack.Navigator>
      </NavigationContainer>
    </PaperProvider>
  );
}

export default function App() {
  return <MyStack />
}