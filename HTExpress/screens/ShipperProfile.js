import React from 'react';
import { View, Text, Image, StyleSheet, SafeAreaView } from 'react-native';

const ShipperProfile = ({ route }) => {

    const { shipper } = route.params;
    return (
        <SafeAreaView className="space-y-4 flex-1">
            <View style={styles.container}>
                <Image source={{ uri: shipper.avatar }} style={styles.avatar} />
                <View style={styles.infoContainer}>
                    <Text style={styles.name}>{shipper.first_name} {shipper.last_name}</Text>
                    <Text style={styles.email}>Email: {shipper.email}</Text>
                    <Text style={styles.phone}>Số điện thoại: {shipper.phone}</Text>
                    <Text style={styles.identityCard}>Căn cước công dân: {shipper.identityCard}</Text>
                </View>
            </View>
        </SafeAreaView>

    );
};

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        alignItems: 'center',
        padding: 10,
        borderBottomWidth: 1,
        borderBottomColor: '#ccc',
    },
    avatar: {
        width: 80,
        height: 80,
        borderRadius: 40,
        marginRight: 10,
    },
    infoContainer: {
        flex: 1,
    },
    name: {
        fontSize: 18,
        fontWeight: 'bold',
    },
    email: {
        fontSize: 16,
        color: 'gray',
    },
    phone: {
        fontSize: 16,
    },
    identityCard: {
        fontSize: 16,
    },
    approved: {
        fontSize: 16,
        color: 'green',
    },
    pending: {
        fontSize: 16,
        color: 'orange',
    },
});

export default ShipperProfile;
