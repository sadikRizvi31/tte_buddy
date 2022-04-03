
import 'package:flutter/material.dart';

class CaptionText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;


  CaptionText({@required this.text, this.color, this.align,this.maxLine});

  @override  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: style(context),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {
    if (color != null) {
      return Theme.of(context).textTheme.caption.copyWith(color: this.color);
    } else {
      return Theme.of(context).textTheme.caption;
    }
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;


  SmallText({@required this.text, this.color, this.align,this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 12.0,color: color),
      maxLines: maxLine,
    );
  }
}

class Body1Text extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;


  Body1Text({@required this.text, this.color, this.align,  this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      style: style(context),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {
    if (color != null) {
      return Theme.of(context).textTheme.bodyText2.copyWith(color: this.color);
    } else {
      return Theme.of(context).textTheme.bodyText2;
    }
  }
}

class Body2Text extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;


  Body2Text({@required this.text, this.color, this.align,this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      style: style(context),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {
    if (color != null) {
      return Theme.of(context).textTheme.bodyText1.copyWith(color: this.color);
    } else {
      return Theme.of(context).textTheme.bodyText1;
    }
  }
}

class SubHeadText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;


  SubHeadText({@required this.text, this.color, this.align,this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      textAlign: align,
      style: style(context),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {
    if (color != null) {
      return Theme.of(context).textTheme.subtitle1.copyWith(color: this.color);
    } else {
      return Theme.of(context).textTheme.subtitle1;
    }
  }
}

class TitleText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;


  TitleText({@required this.text, this.color, this.align,this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: false,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: style(context).copyWith(fontSize: 16.0),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {
    if (color != null) {
      return Theme.of(context).textTheme.headline6.copyWith(color: this.color);
    } else {
      return Theme.of(context).textTheme.headline6;
    }
  }
}

class SubTitleText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;


  SubTitleText({@required this.text, this.color, this.align, this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: style(context),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {
    if (color != null) {
      return Theme.of(context).textTheme.subtitle1.copyWith(color: this.color);
    } else {
      return Theme.of(context).textTheme.subtitle1;
    }
  }
}

class HeadlineText extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;

  HeadlineText({@required this.text, this.color, this.align,this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: style(context),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {
    if (color != null) {
      return Theme.of(context).textTheme.headline1.copyWith(color: this.color);
    } else {
      return Theme.of(context).textTheme.headline1;
    }
  }
}

class Display1Text extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign align;
  final int maxLine;

  Display1Text({@required this.text, this.color, this.align, this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: style(context),
      maxLines: maxLine,
    );
  }

  TextStyle style(BuildContext context) {
    if (color != null) {
      return Theme.of(context).textTheme.headline4.copyWith(color: this.color);
    } else {
      return Theme.of(context).textTheme.headline4;
    }
  }
}
