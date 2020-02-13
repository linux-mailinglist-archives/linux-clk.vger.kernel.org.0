Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC8B15B4DF
	for <lists+linux-clk@lfdr.de>; Thu, 13 Feb 2020 00:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729258AbgBLXjs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Feb 2020 18:39:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:57604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729237AbgBLXjr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Feb 2020 18:39:47 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 563C320578;
        Wed, 12 Feb 2020 23:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581550787;
        bh=Ew5t4898iwRtdNmtDXVvo2DtXPQNTHCICkO0CUTsV0g=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PLB3VNpo0rIteXIq+K7uS3tCf4lhEgE0gd5AHzN2D9a+1tYhYF/MtedddeGbNBbAC
         ajJ7bxofHyqCXp6Rel0Yvb3bMYR11QUT3Q/LeJyAC1j9oLADXfO1lhRI9abgqEOURM
         5rdwGLsf8oAMLPpQVxfzjQ00eWCx5CCCcQ++iyfQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191206133414.23925-1-geert+renesas@glider.be>
References: <20191206133414.23925-1-geert+renesas@glider.be>
Subject: Re: [PATCH] clk: Fix continuation of of_clk_detect_critical()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Date:   Wed, 12 Feb 2020 15:39:46 -0800
Message-ID: <158155078656.184098.15639971053640171247@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2019-12-06 05:34:14)
> The second line of the of_clk_detect_critical() function signature is
> not indented according to coding style.
>=20
> Fixes: d56f8994b6fb928f ("clk: Provide OF helper to mark clocks as CRITIC=
AL")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next
