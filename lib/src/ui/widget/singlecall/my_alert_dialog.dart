import 'package:flutter/material.dart';
import 'package:tencent_calls_uikit/src/i18n/i18n_utils.dart';


class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    Key? key,
    this.title,
    this.content = '',
    this.onlyOk = false,
    this.cancelText,
    this.okText,
    this.onCancel,
    this.onOk,
  }) : super(key: key);

  final String? title;
  final String content;
  final bool onlyOk;
  final String? cancelText;
  final String? okText;
  final VoidCallback? onCancel;
  final VoidCallback? onOk;

  @override
  Widget build(BuildContext context) {

    Widget contentWidget = Container();
    if (content.isNotEmpty) {
      contentWidget = Text(
        content,
        style: const TextStyle(color: Colors.black, fontSize: 18),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  title ?? '提示',
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                contentWidget,
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFEFEFEF)),
          Row(
            children: [
              if (!onlyOk) ...[
                Expanded(
                  child: InkWell(
                    onTap: onCancel,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(
                        cancelText ?? CallKit_t('cancel'),
                        style: const TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(color: const Color(0xFFEFEFEF), width: 1, height: 50),
              ],
              Expanded(
                child: InkWell(
                  onTap: onOk,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Text(
                      okText ?? CallKit_t('confirm'),
                      style: const TextStyle(
                        color: Color(0xFF2B74EA),
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
