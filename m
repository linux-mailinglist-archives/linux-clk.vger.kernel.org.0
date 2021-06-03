Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A582399A78
	for <lists+linux-clk@lfdr.de>; Thu,  3 Jun 2021 08:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhFCGJy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 3 Jun 2021 02:09:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:60814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhFCGJy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Jun 2021 02:09:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EDD0613D8;
        Thu,  3 Jun 2021 06:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622700490;
        bh=Ni4FnwlE7iP+i1fvRm3QaBqUK1LzsPVCrZOBTZaYPsU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KERH2u0PHxwtpkaqHqQzjbmTriH8O9Ta4Yv1C5sGFW/ak7tvzeqCHpgm2pOkTw/si
         gQZG02/9Pdv8phpLohbPlgOsGwY6g1raCE7t3prKiUhq+0Q2qTY9mNPnLitxi9d3r0
         StG757xSepAm2hVcOhnsZL/g4BFBylHZCqHnI/hjc35ZbNqXrqTPnWPPulynKflZyP
         8iCI63iCFUZY74/6JnI9Micdv7B4QOQYVkvxwNgocFFEuKRyY95e4ZN6nZD+SyFsg1
         KxjScARXMLmK7wuNQFxjk94eAjbfrPEOxiytR3YkKPGoMecjG0bEN3AwS+v3t8IlLK
         FPtxhTjKXgMmQ==
Subject: Re: [PATCH v2 0/2] clk: keystone: Add support for AM64 specific
 ehrpwm-tbclk
To:     Lokesh Vutla <lokeshvutla@ti.com>, mturquette@baylibre.com,
        sboyd@kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Device Tree Mailing List <devicetree@vger.kernel.org>,
        ssantosh@kernel.org, Vignesh R <vigneshr@ti.com>,
        linux-clk@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>
References: <20210528045743.16537-1-lokeshvutla@ti.com>
From:   Tero Kristo <kristo@kernel.org>
Message-ID: <a33393b0-db88-ca2d-a51c-9f25880ff0e3@kernel.org>
Date:   Thu, 3 Jun 2021 09:08:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210528045743.16537-1-lokeshvutla@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/05/2021 07:57, Lokesh Vutla wrote:
> This series adds support for AM64 specific ehrpwm Time-base submodule
> clock.
> 
> Changes since v1:
> - Fixed register offsets and bits for clocks.
> - Update the compatible to ti,am64-epwm-tbclk, as high resolution is not
>    supported in AM64.
> 
> Lokesh Vutla (2):
>    dt-bindings: clock: ehrpwm: Add support for AM64 specific compatible
>    clk: keystone: syscon-clk: Add support for AM64 specific ehrpwm-tbclk
> 
>   .../bindings/clock/ti,am654-ehrpwm-tbclk.yaml   |  4 +++-
>   drivers/clk/keystone/syscon-clk.c               | 17 +++++++++++++++++
>   2 files changed, 20 insertions(+), 1 deletion(-)
> 

For the whole series:

Reviewed-by: Tero Kristo <kristo@kernel.org>
