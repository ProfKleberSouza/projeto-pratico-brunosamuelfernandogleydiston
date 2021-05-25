import * as React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import { NavigationContainer } from '@react-navigation/native';

import Login from './components/login';
import Signup from './components/signup';
import Dashboard from './components/dashboard';
import Profile from './components/profile';
import Lista from './components/list';
import Chat from './components/chat';
import DashBoardNavBar from './components/dashboard/navbar';
import { Provider as PaperProvider } from 'react-native-paper';
import customTheme from './themes';
import Donation from './components/donation';
import editDonation from './components/editDonation';

const Stack = createStackNavigator();

function MyStack() {
  return (
    <PaperProvider theme={customTheme}>
      <NavigationContainer theme={customTheme}>
        <Stack.Navigator
          initialRouteName="Home">
          <Stack.Screen name="Login" component={Login} options={{ headerShown: false }} />
          <Stack.Screen name="Signup" component={Signup} options={{ headerShown: false }} />
          <Stack.Screen name="Dashboard" component={Dashboard}
            options={{ headerTitle: props => <DashBoardNavBar {...props}/> }} />
          <Stack.Screen name="Profile" component={Profile} options={{
            headerShown: true,
            headerTitle: 'Menu',
            headerTransparent: true,
            headerTintColor: '#ffffff',
            headerStyle: { backgroundColor: '#63dadb' }
          }} />
          <Stack.Screen name="Lista" component={Lista} />
          <Stack.Screen name="Chat" component={Chat} />
          <Stack.Screen name="Donation" component={Donation} />
          <Stack.Screen name="editDonation" component={editDonation} />
        </Stack.Navigator>
      </NavigationContainer>
    </PaperProvider>
  );
}

export default function App() {
  return <MyStack />
}
