Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9DE1CF95D
	for <lists+linux-clk@lfdr.de>; Tue, 12 May 2020 17:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730802AbgELPh3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 12 May 2020 11:37:29 -0400
Received: from v6.sk ([167.172.42.174]:53270 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727847AbgELPh3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 May 2020 11:37:29 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 0A134610A8;
        Tue, 12 May 2020 15:36:57 +0000 (UTC)
Date:   Tue, 12 May 2020 17:36:54 +0200
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 07/11] ASoC: mmp-sspa: Prepare/unprepare the clocks
Message-ID: <20200512153654.GB604838@furthur.local>
References: <20200511210134.1224532-1-lkundrak@v3.sk>
 <20200511210134.1224532-8-lkundrak@v3.sk>
 <20200512124520.GH5110@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512124520.GH5110@sirena.org.uk>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, May 12, 2020 at 01:45:20PM +0100, Mark Brown wrote:
> On Mon, May 11, 2020 at 11:01:30PM +0200, Lubomir Rintel wrote:
> > The driver enables the clocks without preparing them and disables
> > without unpreparing afterwards. Fix that.
> 
> This fix should've been earlier in the series so it could be sent as a
> fix.

I'll order it earlier on v2.

However, there's not much of a point in picking this patch alone,
because the driver is certainly not used anywhere and very likely
doesn't even work to any sensible extent without the rest of the
series.

Lubo
