import 'package:flutter/material.dart';


import '../../../../common/constants/constant.dart';

class SchoolDetailScreenStatistic extends StatelessWidget {
  const SchoolDetailScreenStatistic({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPostStatistic();
  }

  _buildPostStatistic(){
    const emptyPlaceholder = Padding(
      padding: EdgeInsets.only(top: SWSizes.s16),
      child: Center(child: Text('Belum ada data laporan')),
    );
    return false
        ? emptyPlaceholder
        : Column(
      children: [
        Text('Jumlah Penaman ${14}'),
        ListView(
          children: [
            Row(
              children: [
                CircleAvatar(
                    child: Image.asset('assets/images/ub_logo.png')
                ),
                Text('Kacang Bogor Varitas Universitas Brawijaya'),
                Text('${14}')
              ],
            )
          ],
        )
      ],
    );
  }

}

