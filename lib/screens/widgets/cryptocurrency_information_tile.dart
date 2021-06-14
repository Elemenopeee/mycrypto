import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mycrypto/models/cryptocurrency.dart';
import 'package:mycrypto/utilities/routes.dart';

class CryptocurrencyInformationTile extends StatelessWidget {
  final Cryptocurrency cryptocurrency;
  final Function onTap;

  const CryptocurrencyInformationTile(
      {Key key, @required this.cryptocurrency, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(CRYPTOCURRENCY_DETAILS_SCREEN,
            arguments: cryptocurrency);
      },
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Text(
              cryptocurrency.symbol ?? '',
              maxLines: 1,
            ),
          ),
        ],
      ),
      title: Text(
        cryptocurrency.name ?? '',
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Rank : ${cryptocurrency.rank ?? ''}',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '|',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Last active on : ',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          Expanded(
            child: Text(
              DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY)
                  .format(cryptocurrency.lastHistoricalDate),
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),

    );
  }
}