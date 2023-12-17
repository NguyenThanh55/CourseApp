import { View, Text, ViewStyle, StyleProp} from 'react-native'
import React, {ReactNode} from 'react'
import { styles } from './../style/global';

interface Props {
    children: any;
    localStyles?: StyleProp<ViewStyle>;
}

const RowComponent = (props: Props) => {
    const {children, localStyles} = props;
  return (
    <View
      style={[
        localStyles,
        styles.tabBarContainer,
        {
            flexDirection: 'row',
            paddingHorizontal: 12,
            paddingVertical: 12,
        },
      ]}>
        {children}
    </View>
  )
}

export default RowComponent;