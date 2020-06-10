Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC28D1F4B11
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jun 2020 03:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgFJBzH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 9 Jun 2020 21:55:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:37842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgFJBzG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Jun 2020 21:55:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 807072072E;
        Wed, 10 Jun 2020 01:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591754106;
        bh=N6LnZEtWfjgXzjfx9LCAZCqBEFC3lsL1nFY+exu4ubo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=0qVhptjNdFMqz6Ndndp6J00uhZvGsCKlptUGmFyx1omd3u8eDOtGXXfespGkvMhn6
         r4vGDt5AQjRFcFTl/SbkBKO14rnRcDbKdtq/sPR6lSQSd2Eu53E2SwxurIKL77F6HD
         Dgn99nQsxCeD4eLG5PDdcvlKn+ovu3GeJfke6V5c=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200609231702.29863-1-sarangmairal@gmail.com>
References: <20200609000816.23053-2-sarangmairal@gmail.com> <20200609231702.29863-1-sarangmairal@gmail.com>
Subject: Re: [PATCH 1/1] clk: add lock protection to clk_hw_round_rate() API
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sarang Mairal <sarangmairal@gmail.com>
To:     Sarang Mairal <sarangmairal@gmail.com>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com
Date:   Tue, 09 Jun 2020 18:55:05 -0700
Message-ID: <159175410579.242598.18073002281633124483@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sarang Mairal (2020-06-09 16:17:02)
>=20
> > This is making things worse. By adding the lock here we're making the
> > prepare lock more recursive which is not intended. Probably the caller
> > is broken and shouldn't be calling this API from places that aren't
> > already holding the lock.
> Ok, thanks. Makes sense. If clk_hw_round_rate() is to be called from
> a clk_ops callback then in this problem situation, usage of the API is at
> fault.
> I will initiate a discussion in the downstream kernel forum to get this
> problem addressed correctly.
>=20
> As a very minor follow up, do you think a small doxygen note about usage
> of clk_hw_round_rate() API from within clk ops is useful for clk providers
> to avoid such a trap? If not, then we can close this thread.
>=20

Sure a documentation update would be a welcome addition to this area of
the code.
