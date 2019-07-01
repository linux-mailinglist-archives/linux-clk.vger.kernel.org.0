Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8BF538159
	for <lists+linux-clk@lfdr.de>; Fri,  7 Jun 2019 00:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfFFW4d (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 6 Jun 2019 18:56:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:44722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726352AbfFFW4d (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 6 Jun 2019 18:56:33 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 45EE32089E;
        Thu,  6 Jun 2019 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559861792;
        bh=E9bmdThWnZM5wjGabhY6OrvCZOTpZUpOafsqSHjs9Ys=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=1hvEr86WkE0f1Yq9Z/8HZ5ecFcIGHEmS55k3uZCRfL3j2BEhI0D4/CGyT3wZbBOJT
         p05+xotlO1lU8rbyQ98+T942EtW2xoEx0Ad5JE+oNxT5oI+BQxNfw5NFkC7FWk/zBV
         4kVXW0eXIMypcY8YrNOajUZEngWqu7TCRRnESJs4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190502121843.14493-1-fparent@baylibre.com>
References: <20190502121843.14493-1-fparent@baylibre.com>
To:     Fabien Parent <fparent@baylibre.com>, mark.rutland@arm.com,
        matthias.bgg@gmail.com, mturquette@baylibre.com,
        robh+dt@kernel.org, ryder.lee@mediatek.com, sean.wang@mediatek.com,
        wenzhen.yu@mediatek.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: audsys: add support for MT8516
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>
User-Agent: alot/0.8.1
Date:   Thu, 06 Jun 2019 15:56:31 -0700
Message-Id: <20190606225632.45EE32089E@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabien Parent (2019-05-02 05:18:42)
> Add AUDSYS device tree bindings documentation for MediaTek MT8516 SoC.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---

Applied to clk-next

