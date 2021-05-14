import firebase from '../database/firebase'


export function userLogin(email, password, callback) {
    if (email === '' && password === '') {
        throw ('Enter details to signin!');
    } else {
        firebase
            .auth()
            .signInWithEmailAndPassword(email, password)
            .then(callback())
            .catch(error => console.log(error.message))
    }
}

export function isLogged(callback) {
    return firebase
        .auth()
        .onAuthStateChanged((user) => {
            if (user)
                callback();
        });
}

export function registerUser(email, password, callback) {
    if (email === '' && password === '') {
        throw ('Enter details to signup!');
    } else {
        firebase
            .auth()
            .createUserWithEmailAndPassword(email, password)
            .then(callback())
            .catch(error => console.log(error.message))
    }
}