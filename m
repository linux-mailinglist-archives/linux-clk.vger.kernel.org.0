Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EFB311E18
	for <lists+linux-clk@lfdr.de>; Sat,  6 Feb 2021 15:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhBFO4b (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 6 Feb 2021 09:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhBFO41 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 6 Feb 2021 09:56:27 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A23C061793
        for <linux-clk@vger.kernel.org>; Sat,  6 Feb 2021 06:55:27 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a9so17669544ejr.2
        for <linux-clk@vger.kernel.org>; Sat, 06 Feb 2021 06:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=pH4HPozQqV9KFhmJi4ejr7uhXwGKo1eiMrsOL5wzQtBzaz1Dc23ClTW3PwppguNuBX
         8zRtYXMbiy4s0UDHIqxgK5weemlNbs5zp9N4EAmdC8m5pX7TBVW92FEAWNGvIm/gDj72
         +PXcQYkBHm+ogJVyUnABCqkpUGWYxKmIQINw5bNQOaeIfHEwFh7V9b67bGVyWjRUIewh
         nV1Gae/ZFfyNZ8Zkg9JTgJQZ5pLgknhH/1G5Xf6Hmy0KQJHLGShL+3WiOf6BIbkF+srw
         O7NZigDzwVmXZeZLgdonz3IxHpP7rkH47qFM4eZvEzJ/RbPDNzPSBUQySG2eCYIgOVoq
         QIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=H9uU1HFYByEPQw4seFWGHKuTvR+N+1Xn8up+9WpiF9hCVezB08Wsd6RhVXoVUXllCj
         uVcVC2F/kG4EUxG5/5rkTspit8AAGayJp4RihCejcb2DWke5cadrKSnULGRcXDLkywdm
         H3ujf6h03fPxJG4GlPBEEgio9R71zeiCw65AIsnYegekoglUSbUa/WcJ+xkDk4pibblM
         02fNBpButjE+UulJp79H0zE9WAuSafO0tv7NA4vrmy1wcJn0GmoSffEhbKYckt5LmNOs
         GIPgNUnQMD0X3Df5rMulOFhgGmM3YrEeph/pFY2mbQY/ZcyUwhqG8mrEPqJT/tyikrPJ
         o2LQ==
X-Gm-Message-State: AOAM531kZr+J1ebF7345+eVV/1z0FkSynrOJRqz64g0LBuS798MFL4l5
        PQrex6PSQ7VBStIKibD/fbTpUrbJySw1hGU6iz4=
X-Google-Smtp-Source: ABdhPJwHU6txPxzzBy8IWp7Ku3rDq1bEw0HUp8r3leXrGTAHG2vbKmnpDthJEiUtX7neXJxaVqL8r5g7DwG6Kdcef3k=
X-Received: by 2002:a17:906:5659:: with SMTP id v25mr9403850ejr.8.1612623326665;
 Sat, 06 Feb 2021 06:55:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:55:26
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:55:26 +0100
Message-ID: <CAGSHw-DWoS9pVOTJHrH-gLzXAO-xFO0WbCFx1uMqoCPnh_wpZQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
