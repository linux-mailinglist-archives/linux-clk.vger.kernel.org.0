Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC14E79AB4
	for <lists+linux-clk@lfdr.de>; Mon, 29 Jul 2019 23:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388361AbfG2VMy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 29 Jul 2019 17:12:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:55922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387819AbfG2VMy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 29 Jul 2019 17:12:54 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 891E82073F;
        Mon, 29 Jul 2019 21:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564434773;
        bh=wbhwmNnzi5ZR+95bS62dBjwGzX859gJQO+VLe6sSl58=;
        h=In-Reply-To:References:From:To:Subject:Cc:Date:From;
        b=pnQAHfynnEzVRWkazXDs2WNDKwobqDTMfs3PmDUD3cN5O/iUZ66XTwJ1czOxNSZd3
         +8oazfrfBpCrYJhM6ayIhAgfEu8bQP6JGZd+oKVzmc8wMpn3yUX/8c8BX01iq+J4QC
         EcH8GB0qw/nBh9BpLJMvj39GzgtwSpaKc0yRCRFc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190723230843.19922-1-robh@kernel.org>
References: <20190723230843.19922-1-robh@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: allwinner,sun4i-a10-ccu: Correct path in $id
Cc:     linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Mon, 29 Jul 2019 14:12:52 -0700
Message-Id: <20190729211253.891E82073F@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rob Herring (2019-07-23 16:08:43)
> The path in the schema '$id' value is wrong. Fix it.
>=20
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

