Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2379431E7BC
	for <lists+linux-clk@lfdr.de>; Thu, 18 Feb 2021 10:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbhBRI7l (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 18 Feb 2021 03:59:41 -0500
Received: from mail.manjaro.org ([176.9.38.148]:41888 "EHLO mail.manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230468AbhBRIzE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Feb 2021 03:55:04 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.manjaro.org (Postfix) with ESMTP id AE9C33E60012;
        Thu, 18 Feb 2021 09:53:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
        by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SW9Vy6rv8ZvD; Thu, 18 Feb 2021 09:53:42 +0100 (CET)
Subject: Re: [PATCH] clk: sunxi-ng: v3s: add support for variable rate audio
 pll output
To:     Tobias Schramm <t.schramm@manjaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Icenowy Zheng <icenowy@aosc.io>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20210212135725.283877-1-t.schramm@manjaro.org>
 <20210218075835.o43tyarpimrcwbvk@gilmour>
 <7379a9c3-3578-5cf1-53ed-ace8ff68434b@manjaro.org>
From:   Tobias Schramm <t.schramm@manjaro.org>
Message-ID: <2e4c479d-0132-2bb8-2bf1-7eec1a8daa08@manjaro.org>
Date:   Thu, 18 Feb 2021 09:53:39 +0100
MIME-Version: 1.0
In-Reply-To: <7379a9c3-3578-5cf1-53ed-ace8ff68434b@manjaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> Hi Maxime,
>>
>> It's not really clear to me how that would help.
>>
>> The closest frequency we can provide for 24.576MHz would be 24580645 Hz,
>> with N = 127, M = 31 and P = 4, so it would work with what we have
>> already?
>>
> 
> As far as I'm aware the multiplier N ranges from 0 to 128 (offset of 1 
That should have of course been "from 1 to 128".
> from 0 to 127). Thus 24MHz * 128 / 25 / 5 = 24.576MHz. Since this 
> requires the postdiv to be set to 5 it is not supported yet.
> 
> Cheers,
> Tobias
