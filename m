Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76CFB18DD4B
	for <lists+linux-clk@lfdr.de>; Sat, 21 Mar 2020 02:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbgCUBZZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 Mar 2020 21:25:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:46462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727922AbgCUBZY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 20 Mar 2020 21:25:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EEB5B20752;
        Sat, 21 Mar 2020 01:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584753924;
        bh=WsWYKSU47uiJNHIr8ngS+x4WBnd1J9kfnIffh7q+PFs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SuOmKDH4mFwfASBaA2ht56R2ikzxyDDya9VuDemHoXL/sLr47hYXBqby0s9LRgvRt
         jjX3/p11zXDJW0vIiQbj2gT8WsL+AYnUI7+esmRkr85xgzHLYtQlXTga3dL/KHQZU3
         iBK/pP0DgwO27hgP0vj6aGlQf8IwoRoXo0kXXdXU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200309194254.29009-15-lkundrak@v3.sk>
References: <20200309194254.29009-1-lkundrak@v3.sk> <20200309194254.29009-15-lkundrak@v3.sk>
Subject: Re: [PATCH v2 14/17] clk: mmp2: Add clocks for the thermal sensors
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Lubomir Rintel <lkundrak@v3.sk>
To:     Lubomir Rintel <lkundrak@v3.sk>
Date:   Fri, 20 Mar 2020 18:25:23 -0700
Message-ID: <158475392307.125146.13543743868856093457@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lubomir Rintel (2020-03-09 12:42:51)
> The register definitions gotten from OLPC Open Firmware.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
>=20
> ---

Applied to clk-next
