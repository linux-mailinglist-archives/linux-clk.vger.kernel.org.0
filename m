Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0E658CEC
	for <lists+linux-clk@lfdr.de>; Thu, 27 Jun 2019 23:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbfF0VRe (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 27 Jun 2019 17:17:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:53348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726595AbfF0VRe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 27 Jun 2019 17:17:34 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAF71208CB;
        Thu, 27 Jun 2019 21:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561670253;
        bh=tjUVhNwUylYppI6L6ObcmsGvQ+mV0tCzi7qFIIABWjY=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=aWl5mqAk/vpVHjuT4R7MHOR602Sabl1/FTGMf9lDfznlYJKf/cslkrOdOoRm2rFBh
         EC9vqz3p0DLCo95kIUJnNUlhQATKxV3UoWXeJZEz4YGYGVP6fThubszzVZ8tsVayD1
         Rc/7iZEs4/VddxPSRsOK7+gi5DGcxUSnPseEA674=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190627085517.17587-1-ckeepax@opensource.cirrus.com>
References: <20190627085517.17587-1-ckeepax@opensource.cirrus.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: lochnagar: Update DT binding doc to include the primary SPDIF MCLK
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@opensource.cirrus.com
User-Agent: alot/0.8.1
Date:   Thu, 27 Jun 2019 14:17:33 -0700
Message-Id: <20190627211733.BAF71208CB@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Charles Keepax (2019-06-27 01:55:17)
> This clock was missed when the binding was initially merged but is
> supported by the driver, so add it to the binding document.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Applied to clk-next

