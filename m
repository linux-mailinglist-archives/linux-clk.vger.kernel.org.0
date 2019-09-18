Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC1CB5AAC
	for <lists+linux-clk@lfdr.de>; Wed, 18 Sep 2019 07:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfIRFI2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 18 Sep 2019 01:08:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:45272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbfIRFI2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Sep 2019 01:08:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B95DD214AF;
        Wed, 18 Sep 2019 05:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568783307;
        bh=7hVkkxzPoYwB2Fh6++E0xtdUTgGTVtVOgcLEbAH+TBg=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=BmjA+WGedyi3/c70EEQ7PlrXvTTY2EuX0GKe9zO7jISwC93tIOLK5jVFCPqfR6ocn
         BeBJn6ENTQ7xKZ+HN8fM1/LJ72RNzRivVZdiqpqAzaZwOB02RIx9utqRasadRqGZMk
         HD5doA9r1OZqw72/datcmkai4h0VxGlSTTNrhCwA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190805100310.29048-4-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com> <20190805100310.29048-4-miquel.raynal@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Stefan Chulski <stefanc@marvell.com>,
        Yan Markman <ymarkman@marvell.com>,
        Christine Gharzuzi <chrisg@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
To:     Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/8] clk: mvebu: ap806-cpu: prepare mapping of AP807 CPU clock
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 22:08:26 -0700
Message-Id: <20190918050827.B95DD214AF@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Miquel Raynal (2019-08-05 03:03:05)
> From: Christine Gharzuzi <chrisg@marvell.com>
>=20
> This patch allows same flow to be executed on chips with different
> register mappings like AP806 and, in the future, AP807.
>=20
> Note: this patch has no functional effect, and only prepares the
> driver for additional chips to be supported by retrieving the right
> device data depenging on the compatible property.
>=20
> Signed-off-by: Christine Gharzuzi <chrisg@marvell.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

Applied to clk-next

