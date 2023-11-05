Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336BD7E1746
	for <lists+linux-clk@lfdr.de>; Sun,  5 Nov 2023 23:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjKEWBf (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 5 Nov 2023 17:01:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbjKEWBd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Nov 2023 17:01:33 -0500
X-Greylist: delayed 5286 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 05 Nov 2023 14:01:31 PST
Received: from SMTP-HCRC-200.brggroup.vn (unknown [42.112.212.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E93ABF
        for <linux-clk@vger.kernel.org>; Sun,  5 Nov 2023 14:01:30 -0800 (PST)
Received: from SMTP-HCRC-200.brggroup.vn (localhost [127.0.0.1])
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTP id 70C5119139;
        Mon,  6 Nov 2023 01:57:44 +0700 (+07)
Received: from zimbra.hcrc.vn (unknown [192.168.200.66])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by SMTP-HCRC-200.brggroup.vn (SMTP-CTTV) with ESMTPS id 6A0D419283;
        Mon,  6 Nov 2023 01:57:44 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id 056BB1B8253C;
        Mon,  6 Nov 2023 01:57:46 +0700 (+07)
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id dSYwkIM8QENY; Mon,  6 Nov 2023 01:57:45 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.hcrc.vn (Postfix) with ESMTP id C31A81B8252B;
        Mon,  6 Nov 2023 01:57:45 +0700 (+07)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.hcrc.vn C31A81B8252B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hcrc.vn;
        s=64D43D38-C7D6-11ED-8EFE-0027945F1BFA; t=1699210665;
        bh=WOZURJ77pkiMUL2pPLC14ifVPRvyTQIBEQmxuN1ezAA=;
        h=MIME-Version:To:From:Date:Message-Id;
        b=bHesgO+EFhHRGyCW/Fw7GFO8a/2UOW4YlZT39BeiNUt9PxGG63FGMWc0zfdRsI934
         AUlxCS5lVtUrHJweARTqksiVesvoGbeQhJhAI1uqFY2fwE9EUS+fGWkbK6ROZBti7K
         d6Xr1oC5AZRa+QUa+tWnZSRLaGWt2On7/lz8AYd1E2h2lb+bdIPqmi8ddKGE+2UZOS
         1KlYZ05lm4BchDZszP/NQcRhfCGB4TSpUzFF+/rAigJNjs1psj7wIt01LTFA1DJVyi
         4oziu1nYJgF6ZtqkfwSrJoi+TzVXndPJnwALc1in0kiYdq6MVyW/p9oc7jff/WNDC5
         KpuwQ7gPPS5sQ==
X-Virus-Scanned: amavisd-new at hcrc.vn
Received: from zimbra.hcrc.vn ([127.0.0.1])
        by localhost (zimbra.hcrc.vn [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id f4lz9EFtdqsi; Mon,  6 Nov 2023 01:57:45 +0700 (+07)
Received: from [192.168.1.152] (unknown [51.179.100.52])
        by zimbra.hcrc.vn (Postfix) with ESMTPSA id 721B01B8223A;
        Mon,  6 Nov 2023 01:57:39 +0700 (+07)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?b?4oKsIDEwMC4wMDAuMDAwPw==?=
To:     Recipients <ch.31hamnghi@hcrc.vn>
From:   ch.31hamnghi@hcrc.vn
Date:   Sun, 05 Nov 2023 19:57:29 +0100
Reply-To: joliushk@gmail.com
Message-Id: <20231105185739.721B01B8223A@zimbra.hcrc.vn>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Goededag,
Ik ben mevrouw Joanna Liu en een medewerker van Citi Bank Hong Kong.
Kan ik =E2=82=AC 100.000.000 aan u overmaken? Kan ik je vertrouwen


Ik wacht op jullie reacties
Met vriendelijke groeten
mevrouw Joanna Liu

