Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B628E3DC65B
	for <lists+linux-clk@lfdr.de>; Sat, 31 Jul 2021 16:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233109AbhGaOnU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 31 Jul 2021 10:43:20 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:53980 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233035AbhGaOnU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 31 Jul 2021 10:43:20 -0400
Received: from [37.162.7.190] (port=62770 helo=[192.168.42.163])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1m9qCm-00BhC9-Iw; Sat, 31 Jul 2021 16:43:12 +0200
Subject: Re: [PATCH v6 1/3] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Sean Anderson <sean.anderson@seco.com>, linux-clk@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>, Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20210723231306.674310-1-sean.anderson@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <04908340-2d88-f36c-c023-8d0179a3910d@lucaceresoli.net>
Date:   Sat, 31 Jul 2021 16:43:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723231306.674310-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: it-IT
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

On 24/07/21 01:13, Sean Anderson wrote:
> These properties allow configuring the SD/OE pin as described in the
> datasheet.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
