import {NativeModules} from 'react-native';

const {CustomModule} = NativeModules;

export type TDataTrx = {
  description: String;
  usage: 'spend' | 'cash_out';
  amount: Number;
};

export const navigateToNativeStatistic = (data: TDataTrx[]) => {
  CustomModule.navigateToStatistic(data);
};
