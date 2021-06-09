Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFCB3A1E6D
	for <lists+linux-clk@lfdr.de>; Wed,  9 Jun 2021 22:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhFIVAD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 9 Jun 2021 17:00:03 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:38990 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229692AbhFIVAD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Jun 2021 17:00:03 -0400
Received: from [77.244.183.192] (port=64848 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lr5H4-0004ZX-T6; Wed, 09 Jun 2021 22:58:06 +0200
Subject: Re: [PATCH] dt-bindings: clk: vc5: Fix example
To:     Sean Anderson <sean.anderson@seco.com>, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Cc:     linux-clk@vger.kernel.org, Adam Ford <aford173@gmail.com>
References: <20210607190546.2616259-1-sean.anderson@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <879c26a0-2fde-3033-0cb3-16fe46932114@lucaceresoli.net>
Date:   Wed, 9 Jun 2021 22:58:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607190546.2616259-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sean,

On 07/06/21 21:05, Sean Anderson wrote:
> The example properties do not match the binding. Fix them, and prohibit
> undocumented properties in clock nodes to prevent this from happening in
> the future.
> 
> Fixes: 766e1b8608bf ("dt-bindings: clk: versaclock5: convert to yaml")
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

Ick, how many mistakes did I put in that darn commit?

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
