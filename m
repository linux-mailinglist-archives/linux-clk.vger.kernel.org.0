Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A56B5BA5
	for <lists+linux-clk@lfdr.de>; Wed, 18 Sep 2019 08:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfIRGIg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 18 Sep 2019 02:08:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:35598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725820AbfIRGIg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Sep 2019 02:08:36 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B93D420856;
        Wed, 18 Sep 2019 06:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568786915;
        bh=eDSFDoUxeXRaSqOmvn/sIqFQjBEcgKvtFO2Fe0pC0PY=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=0inT2mFqrjg0Z+0iF75CCLI6U4LWBotLPUwj0ewQgZ5bmIxGlSBgBsvCQnxZEtjLc
         QL65e/CcwHGClfEbcH13g2exVbmZOvH3KHVkE/UPU5na/6s3qrJKZDHKVulQTIIFXd
         lw46ISiXfhW2UMx1KA41GAzpJRxS3uB0a3gKJTS4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
References: <1568081408-26800-1-git-send-email-aisheng.dong@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V5 00/11] clk: imx8: add new clock binding for better pm support
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 23:08:34 -0700
Message-Id: <20190918060835.B93D420856@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2019-09-09 19:09:57)
> This is a follow up of this patch series.
> https://patchwork.kernel.org/cover/10924029/
> [V2,0/2] clk: imx: scu: add parsing clocks from device tree support
>=20
> This patch series is a preparation for the MX8 Architecture improvement.
> As for IMX SCU based platforms like MX8QM and MX8QXP, they are comprised
> of a couple of SS(Subsystems) while most of them within the same SS
> can be shared. e.g. Clocks, Devices and etc.
>=20
> However, current clock binding is using SW IDs for device tree to use
> which can cause troubles in writing the common <soc>-ss-xx.dtsi file for
> different SoCs.
>=20
> This patch series aims to introduce a new binding which is more close to
> hardware and platform independent and can makes us write a more general
> drivers for different SCU based SoCs.
>=20
> Another important thing is that on MX8, each Clock resource is associated
> with a power domain. So we have to attach that clock device to the power
> domain in order to make it work properly. Further more, the clock state
> will be lost when its power domain is completely off during suspend/resum=
e,
> so we also introduce the clock state save&restore mechanism.

I had some more comments on v4. I'm going to wait for those to be
addressed before reviewing this series.

