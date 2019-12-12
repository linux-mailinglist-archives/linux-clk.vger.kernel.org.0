Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E53F611D916
	for <lists+linux-clk@lfdr.de>; Thu, 12 Dec 2019 23:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731302AbfLLWMR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 12 Dec 2019 17:12:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:49400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730811AbfLLWMQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 12 Dec 2019 17:12:16 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1AD0320663;
        Thu, 12 Dec 2019 22:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576188736;
        bh=6tzUmLVOrqYtdK95F4p2gKe3ZPBjx/6Kq6qIMxho1cM=;
        h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
        b=q16ZlAUs9b8Je3i4oj212HJfCW8uS3cnkrYM1vq0vD+dFo800h9sTDQSjawamteKA
         GmdcEeVYf0CoG8nyZ+PXZchXoaslRrqEpX7aTsQYs8sddk7PU0m5YOKGlurKTAEIjq
         NmgApUCLeieY5EeohjR23wpOslPmVLml+M+avyy4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191209093558.50940-1-maxime@cerno.tech>
References: <20191209093558.50940-1-maxime@cerno.tech>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
To:     Frank Rowand <frowand.list@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: clocks: Convert Allwinner DE2 clocks to a schema
User-Agent: alot/0.8.1
Date:   Thu, 12 Dec 2019 14:12:15 -0800
Message-Id: <20191212221216.1AD0320663@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-12-09 01:35:56)
> The newer Allwinner SoCs have a DE2 clocks controller that is supported in
> Linux, with a matching Device Tree binding.
>=20
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

