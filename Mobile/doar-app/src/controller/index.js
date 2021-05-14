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
            if (user) {
                return callback(true);
            }
            callback(false);
        });
}

export function registerUser(email, password, callback, username = 'John Doe') {
    if (email === '' && password === '') {
        throw ('Enter details to signup!');
    } else {
        firebase
            .auth()
            .createUserWithEmailAndPassword(email, password)
            .then(({ user }) => {
                saveUserProfile(user?.uid, email, username)
                    .then(callback())
            })
            .catch(error => console.log(error.message))
    }
}

export function saveUserProfile(userID, email, username) {

    const data = {
        userID,
        email,
        username,
    };

    return insert('users', data).then(searchUser(userID));
}

export function insert(collection, data, userID) {
    return firebase
        .firestore()
        .collection(collection)
        .doc(userID)
        .set(data)
        .catch((error) => console.log(error.message));
}

export function searchUser(userID) {
    return firebase
        .firestore()
        .collection('users')
        .where("userID", "==", userID)
        .onSnapshot(
            querySnapshot => {
                querySnapshot.forEach(doc => {
                    console.log(doc.data());
                })
            },
            error => {
                console.log(error)
            }
        )
}

export function signOut(callback) {
    firebase
        .auth()
        .signOut()
        .then(() => {
            console.log('logout successfully')
            callback()
        })
        .catch(error => console.log('erro:', error.message))
}
