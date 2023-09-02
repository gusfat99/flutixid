part of 'widgets.dart';

class TicketItem extends StatelessWidget {
  final Ticket ticket;
  final EdgeInsets margin;
  final VoidCallback? onTap;
  const TicketItem(
      {super.key,
      required this.ticket,
      this.margin = EdgeInsets.zero,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: 70,
              margin: const EdgeInsets.only(right: 20.0),
              decoration: BoxDecoration(
                color: grey2Color,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: NetworkImage(
                        '$baseUrlImage/w154${ticket.movieDetail.backdropPath ?? ticket.movieDetail.posterPath}'),
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      (2 * defaultMargin) -
                      90,
                  child: Text(ticket.movieDetail.title,
                      style: blackTextFont.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600),
                      maxLines: 3,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.left),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width -
                      (2 * defaultMargin) -
                      90,
                  child: Text(ticket.movieDetail.genresAndLanguage,
                      style: greyTextFont.copyWith(
                        fontSize: 12,
                        overflow: TextOverflow.clip,
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.left),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width -
                      (2 * defaultMargin) -
                      90,
                  child: Text(ticket.theater.name,
                      style: greyTextFont.copyWith(
                        fontSize: 12,
                        overflow: TextOverflow.clip,
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.left),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width -
                      (2 * defaultMargin) -
                      90,
                  child: Text(ticket.seatsInString,
                      style: greyNumberFont.copyWith(
                        fontSize: 12,
                        overflow: TextOverflow.clip,
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.left),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
