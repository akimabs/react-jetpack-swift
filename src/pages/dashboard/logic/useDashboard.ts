import {navigateToNativeStatistic, TDataTrx} from '../../../utils/bridge-utils';

const useDashboard = () => {
  const getRandomAmount = (): number =>
    Math.floor(Math.random() * (10000 - 1000 + 1) + 1000);

  const data: TDataTrx[] = Array.from({length: 7}, () => ({
    description: 'Makan',
    amount: getRandomAmount(),
    usage: 'cash_out',
  }));

  const _handleNavigatetoStatisticNative = () => {
    navigateToNativeStatistic(data);
  };

  return {_handleNavigatetoStatisticNative};
};

export {useDashboard};
