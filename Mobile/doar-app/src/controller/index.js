import firebase from '../database/firebase'

export function userLogin(email, password, callback) {
    if (email === '' && password === '') {
        throw ('Enter details to signin!');
    } else {
        return firebase
            .auth()
            .signInWithEmailAndPassword(email, password)
            .then(({ user }) => user && callback(true))
            .catch(error => console.log(error.message));
    }
}

export function isLogged(callback) {
    return firebase
        .auth()
        .onAuthStateChanged((user) => callback(user && true))
}

export function registerUser(email, password, username = 'John Doe', callback) {
    if (email === '' && password === '') {
        throw ('Enter details to signup!');
    } else {
        firebase
            .auth()
            .createUserWithEmailAndPassword(email, password)
            .then(({ user }) => {
                saveUserProfile({ userID: user?.uid, email, username })
                    .then(callback())
            })
            .catch(error => console.log(error.message))
    }
}

export function saveUserProfile(data) {
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

export async function getUserProfile() {
    const { currentUser } = await firebase.auth();
    const querySnapshot = await firebase
        .firestore()
        .collection('users')
        .where("userID", "==", currentUser?.uid)
        .get();
    return querySnapshot.docs.map(doc => doc?.data())[0]  ?? {};
}

export async function updateProfile(data) {
    const { currentUser } = await firebase.auth();
    return await insert('users', { ...data, userID: currentUser?.uid }, currentUser?.uid);
}
