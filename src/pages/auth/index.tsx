import React, {memo, useCallback} from 'react';
import {
  Dimensions,
  FlatList,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import {useAuth} from './logic/useAuth';

const ChartItem = memo(({index}: {index: number}) => {
  const styles = [
    {height: 150, backgroundColor: '#c68a5e'},
    {height: 300, backgroundColor: '#3c664a'},
    {height: 250, backgroundColor: '#c8ab60'},
  ];

  return <View style={[styles[index], commonStyles.chart]} />;
});

const Auth = () => {
  const {data, _navigateToDashboard} = useAuth();

  const handleChart = useCallback(
    (item: {index: number}) => <ChartItem index={item.index} />,
    [],
  );

  return (
    <View style={commonStyles.container}>
      <View style={commonStyles.centeredContent}>
        <Text style={commonStyles.title}>Calculafund</Text>
        <TouchableOpacity
          onPress={_navigateToDashboard}
          activeOpacity={0.8}
          style={commonStyles.startButton}>
          <Text style={commonStyles.startButtonText}>Start Journey</Text>
        </TouchableOpacity>
      </View>
      <FlatList
        data={data}
        scrollEnabled={false}
        horizontal
        keyExtractor={(item, _) => item.key}
        renderItem={handleChart}
        style={commonStyles.flatList}
      />
    </View>
  );
};

const commonStyles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#212121',
    justifyContent: 'center',
    alignItems: 'center',
    flexDirection: 'column',
  },
  centeredContent: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  flatList: {
    flex: 0.5,
    alignSelf: 'center',
  },
  chart: {
    width: Dimensions.get('window').width / 3.5,
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
    alignSelf: 'flex-end',
  },
  title: {
    fontSize: 60,
    fontWeight: 'bold',
    color: 'white',
  },
  startButton: {
    height: 50,
    width: 160,
    borderRadius: 7,
    backgroundColor: '#3c664a',
    justifyContent: 'center',
    alignItems: 'center',
    marginTop: 20,
  },
  startButtonText: {
    fontSize: 20,
    fontWeight: 'bold',
    color: 'white',
  },
});

export default Auth;
