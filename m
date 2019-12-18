Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14296125188
	for <lists+linux-clk@lfdr.de>; Wed, 18 Dec 2019 20:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727393AbfLRTLn (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 18 Dec 2019 14:11:43 -0500
Received: from [167.172.186.51] ([167.172.186.51]:49064 "EHLO shell.v3.sk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727406AbfLRTLn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 18 Dec 2019 14:11:43 -0500
X-Greylist: delayed 402 seconds by postgrey-1.27 at vger.kernel.org; Wed, 18 Dec 2019 14:11:42 EST
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 29463DFB12;
        Wed, 18 Dec 2019 19:05:02 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id s628JH_vN0ia; Wed, 18 Dec 2019 19:05:01 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 59FACDFB68;
        Wed, 18 Dec 2019 19:05:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id yDVppP1zEJfC; Wed, 18 Dec 2019 19:05:01 +0000 (UTC)
Received: from furthur.lan (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id CAF01DD70C;
        Wed, 18 Dec 2019 19:05:00 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Olof Johansson <olof@lixom.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Unbreak parent selection on MMP2 timer mux 
Date:   Wed, 18 Dec 2019 20:04:52 +0100
Message-Id: <20191218190454.420358-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Patches chained to this message fix timer mux parent determination on
MMP2.

They need to go together -- I'm hoping that they'll get acks from CLK
maintainers and make it in via the SoC tree.

Thanks,
Lubo


