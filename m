Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4911589D6
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jun 2019 20:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfF0SWw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 27 Jun 2019 14:22:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:52580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726561AbfF0SWv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 27 Jun 2019 14:22:51 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 360B120B7C;
        Thu, 27 Jun 2019 18:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561659770;
        bh=R9Rju5tiNyj7OaDEDC3/TJHCT4WV1KaFzmKwdI1JROc=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=2HMriT/GvdOwPGAsrkgVFZLjbFxM8saxckDglpZ1TnRw1YEnw3EgmPg/V++92y3mh
         4+uiPxXsHxYVzYNItrGyQlymGu0HlyTXU3L3HAbkBHkQCEjI9cOh7lDCgqaAu4WpXL
         ysaG9z2Yy2bicGEjpLTvcMAcac4WFpmBH7Ljt9tw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1561650825-11213-6-git-send-email-claudiu.beznea@microchip.com>
References: <1561650825-11213-1-git-send-email-claudiu.beznea@microchip.com> <1561650825-11213-6-git-send-email-claudiu.beznea@microchip.com>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        mturquette@baylibre.com, nicolas.ferre@microchip.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 5/7] clk: at91: sckc: remove unnecessary line
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
User-Agent: alot/0.8.1
Date:   Thu, 27 Jun 2019 11:22:49 -0700
Message-Id: <20190627182250.360B120B7C@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Claudiu Beznea (2019-06-27 08:53:43)
> Remove unnecessary line.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Applied to clk-next

