import {Text, TouchableOpacity, View, StyleSheet} from 'react-native';
import {useDashboard} from './logic/useDashboard';

const Dashboard = () => {
  const {_handleNavigatetoStatisticNative} = useDashboard();

  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <View style={styles.buttonsContainer}>
          <TouchableOpacity activeOpacity={1} style={styles.button}>
            <Text style={styles.buttonText}>Explore</Text>
          </TouchableOpacity>
          <TouchableOpacity
            activeOpacity={0.8}
            onPress={_handleNavigatetoStatisticNative}
            style={[styles.button, {backgroundColor: 'transparent'}]}>
            <Text style={styles.buttonText}>Statistic</Text>
          </TouchableOpacity>
        </View>
        <View style={styles.amountContainer}>
          <Text style={styles.amountText}>Rp0</Text>
          <Text style={styles.weekText}>/last week</Text>
        </View>
      </View>
      <View style={styles.list}>
        <Text style={styles.textHeader}>Last Transaction</Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  header: {
    flex: 0.3,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#212121',
  },
  buttonsContainer: {
    flexDirection: 'row',
    marginBottom: 10,
  },
  button: {
    height: 50,
    width: 160,
    borderRadius: 7,
    backgroundColor: '#3c664a',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10,
  },
  buttonText: {
    fontSize: 20,
    fontWeight: 'bold',
    color: 'white',
  },
  amountContainer: {
    flexDirection: 'row',
    marginTop: 10,
  },
  amountText: {
    color: 'white',
    fontSize: 60,
    fontWeight: 'bold',
  },
  weekText: {
    color: 'white',
    marginTop: 20,
  },
  list: {
    margin: 20,
    flex: 0.7,
  },
  textHeader: {
    color: '#212121',
    fontSize: 16,
    fontWeight: '500',
  },
});

export default Dashboard;
