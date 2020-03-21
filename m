Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4723A18DCE9
	for <lists+linux-clk@lfdr.de>; Sat, 21 Mar 2020 01:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgCUAzn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 20 Mar 2020 20:55:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:35362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgCUAzn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 20 Mar 2020 20:55:43 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1547120787;
        Sat, 21 Mar 2020 00:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584752143;
        bh=Y/sJIlvuYprf+VPXcqlpynwnQz/TcOhQVLDePm1yc2c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dECNalIt/XszaSnCpAKbA7+Dt4Wr+ln9rbYrB0/Q0YloxBBOvUGi+bYsvfRbkvBZg
         H4XhyC8RPVK4LWjg08g2s+KVlKcYqcmAR+P+MF7Vvb7Ck2RxGBhVpKsXfzJ1Z88xxQ
         d6Xu4cggCWlRjbM3nzwAQsieqMmmP5M+GXBHXi68=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200219103326.81120-1-linus.walleij@linaro.org>
References: <20200219103326.81120-1-linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3 v3] dt-bindings: clock: Create YAML schema for ICST clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 20 Mar 2020 17:55:42 -0700
Message-ID: <158475214220.125146.7867554547284468458@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2020-02-19 02:33:24)
> The ICST clocks used in the ARM Integrator, Versatile and
> RealView platforms are updated to use YAML schema, and two
> new ICST clocks used by the Integrator IM-PD1 logical module
> are added in the process.
>=20
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next
