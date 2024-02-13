import {useNavigation} from '@react-navigation/native';
import {useMemo} from 'react';

const useAuth = () => {
  const navigation = useNavigation();
  const data = useMemo(
    () => new Array(3).fill(null).map((_, index) => ({key: `${index}`})),
    [],
  );

  const _navigateToDashboard = () => {
    navigation.navigate('Dashboard' as never);
  };

  return {
    data,
    _navigateToDashboard,
  };
};

export {useAuth};
