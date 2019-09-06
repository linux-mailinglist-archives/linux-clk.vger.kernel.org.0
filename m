Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2BAABEC6
	for <lists+linux-clk@lfdr.de>; Fri,  6 Sep 2019 19:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbfIFRbq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 6 Sep 2019 13:31:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:38408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727381AbfIFRbq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 13:31:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BFDA206A1;
        Fri,  6 Sep 2019 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567791106;
        bh=7aJb4vdeyMXKzVvpAalDtmPhAv855yN+1mCLMwAuAOw=;
        h=In-Reply-To:References:To:From:Subject:Date:From;
        b=FDTgzyR3NeTrqAC0ZgwKk0NTLWtxX7oE9np+N39qBUTItOBBNSmwppmjvV01goVr1
         Izp4lCAo8adId5LsA7ErMOz9VnxNzSH5T+/llRdFAts/RD8VMhD+HymBKMfnVNIaq0
         9/+cZ4WqWsgPjwvXYLdQU/cnmUGtqVGohEsFCbhA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <116f2971-c311-81b8-b0b9-0bb6a74b75e4@electromag.com.au>
References: <1561691950-42154-1-git-send-email-preid@electromag.com.au> <116f2971-c311-81b8-b0b9-0bb6a74b75e4@electromag.com.au>
To:     Phil Reid <preid@electromag.com.au>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/2] clk: clk-cdce925: Add regulator support
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 10:31:45 -0700
Message-Id: <20190906173146.0BFDA206A1@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Phil Reid (2019-08-05 01:26:41)
> On 28/06/2019 11:19, Phil Reid wrote:
> > The cdce925 power supplies could be controllable on some platforms.
> > Enable them before communicating with the cdce925.
> >=20
> > Changes from V1
> > - Add devicetree updates
> >=20
> >=20
> > Phil Reid (2):
> >    dt-bindings: clock: cdce925: Add regulator documentation
> >    clk: clk-cdce925: Add regulator support
> >=20
> >   .../devicetree/bindings/clock/ti,cdce925.txt       |  4 +++
> >   drivers/clk/clk-cdce925.c                          | 34 +++++++++++++=
+++++++++
> >   2 files changed, 38 insertions(+)
> >=20
>=20
> Any more feedback on this series?
>=20

Don't think so. Thanks!

